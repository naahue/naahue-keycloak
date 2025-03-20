<#import "sherpa-template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password'); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                      method="post">
                    <div class="${properties.kcFormGroupClass!} no-bottom-margin">
                        <hr/>
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password"
                               type="password" autocomplete="on" autofocus
                               aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                        />
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5"
                                         href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <#if recaptchaRequired??>
                            <script>
                                function onSubmit(token) {
                                    document.getElementById("kc-form-login").submit();
                                }
                            </script>
                            <script src="https://www.recaptcha.net/recaptcha/api.js" async defer></script>
                            <button tabindex="4" onclick="gtm(Events.login('${msg("doLogIn")}'))" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} g-recaptcha" name="login" id="kc-login" data-sitekey="${recaptchaSiteKey}" data-callback='onSubmit' data-action='submit' data-target="button-submit">${msg("doLogIn")}</button>
                        <#else>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </#if>
                  </div>
            </form>
        </div>
      </div>
    </#if>

</@layout.registrationLayout>