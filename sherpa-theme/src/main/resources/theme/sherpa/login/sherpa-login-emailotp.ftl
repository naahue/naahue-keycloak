<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('code'); section>
    <#if section = "header">
        <h2>${msg("doLogIn")}</h2>
    <#elseif section = "form">
        <div class="card__page-link__container" style="margin-bottom: 10px">
            <p class="card__page-link__paragraph">
                ${msg("emailVerifyOtpTitle")} <b>${username?lower_case}</b>
            </p>
        </div>
        <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-code-settings-form" method="post">
            <div class="otp-field" onkeyup="inputAndChange(event)" onpaste="pasteCode(event)">
                <input type="text" maxlength="1" autofocus />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
                <input type="text" maxlength="1" />
            </div>
            <input id="code" name="code" type="text" data-target="input-code" hidden />
            <div id="errors" class="form-control__help-text" style="margin: auto; width: 336px;">
                ${kcSanitize(messagesPerField.get('code'))?no_esc}
            </div>
            <div id="kc-form-buttons" class="card__button-container" style="text-align: center;">
                <input style="width: 75%; cursor: pointer;" onclick="gtm(Events.login('${msg("doLogIn")}'))" name="submit" id="kc-submit" type="submit" value="${msg('doLogIn')}" disabled />
            </div>
        </form>
        <p style="margin-top: 50px; text-align: center;">
            <b>${msg("emailVerifyInstruction2")}</b>
            </br>
            <a href="${url.loginAction}" onclick="gtm(Events.login('${msg("emailVerifyInstruction3")} '))">${msg("emailVerifyInstruction3")}</a>
        </p>
        <div id="kc-form-options" class="card__button-container" style="text-align: center">
            <a id="reset-login" style="margin: auto" href="${url.loginRestartFlowUrl}" onclick="gtm(Events.login('${msg("passwordBackToLogin")}'))" data-target="button-prev-step">
               ${msg("passwordBackToLogin")}
            </a>
        </div>
    </#if>
</@layout.registrationLayout>
