package com.identicum.keycloak;

import java.security.SecureRandom;
import java.util.Base64;
import javax.ws.rs.core.MultivaluedMap;

import org.keycloak.authentication.AuthenticationFlowContext;
import org.keycloak.authentication.AuthenticationFlowError;
import org.keycloak.authentication.authenticators.browser.UsernamePasswordForm;
import org.keycloak.forms.login.LoginFormsProvider;
import org.keycloak.models.UserModel;

public class CustomAuthenticator extends UsernamePasswordForm {

    private static final String CODE_SESSION_ATTRIBUTE = "auth_code";

    private String generateRandomCode() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[4];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes).substring(0, 6);
    }

    @Override
    public void authenticate(AuthenticationFlowContext context) {
        String code = generateRandomCode();
        context.getAuthenticationSession().setAuthNote(CODE_SESSION_ATTRIBUTE, code);

        LoginFormsProvider form = context.form();
        form.setAttribute("generated_code", code);

        context.challenge(form.createLoginUsernamePassword());
    }

    @Override
    public void action(AuthenticationFlowContext context) {
        MultivaluedMap<String, String> formData = context.getHttpRequest().getDecodedFormParameters();
        
        String username = formData.getFirst("username");
        String password = formData.getFirst("password");
        String inputCode = formData.getFirst("auth_code");

        String expectedCode = context.getAuthenticationSession().getAuthNote(CODE_SESSION_ATTRIBUTE);

        if (expectedCode == null || !expectedCode.equals(inputCode)) {
            context.failureChallenge(
                AuthenticationFlowError.INVALID_CREDENTIALS,
                context.form()
                    .setError("Código incorrecto, intenta de nuevo.")
                    .createForm("mi-ftl.ftl")
            );
            return;
        }

        UserModel user = context.getSession().users().getUserByUsername(context.getRealm(), username);

        if (user == null) {
            context.failure(AuthenticationFlowError.INVALID_USER);
            return;
        }

        context.setUser(user);
        context.success();
    }
}
