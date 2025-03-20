<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
    <#elseif section = "form">
        <div>
            <h1 style="text-align: center; font-size: 22px;">${msg(consentTitle)}</h1>
        </div>
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div style="width: 80%; margin: auto;">
                <p style="color:#222222;font-size: 1em; text-align: center; margin: 0 0 1em 0;" id="kc-page-title">${kcSanitize(msg(consentDescription, url.resourcesPath))?no_esc}</p>
            </div> 
            <input name="response" value="true" hidden />
            <div id="kc-form-buttons" class="cc-header-container">
                <input tabindex="2" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("proceed")}" />
            </div>
            <div id="kc-form-buttons" class="cc-header-container">
                <a href="${url.loginAction}"  onclick="gtm(Events.login('${msg("doNoThanks")}'))">${kcSanitize(msg("doNoThanks"))?no_esc}</a>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>