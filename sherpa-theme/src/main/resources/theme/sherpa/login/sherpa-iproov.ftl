<#import "sherpa-template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('code'); section>
    <#if section = "header">
        <h2>${msg("doLogIn")}</h2>
    <#elseif section = "form">
    <script src="${url.resourcesPath}/js/iProovMe.js" type="text/javascript"></script>
    <script src="${url.resourcesPath}/js/iProovSupport.js" type="text/javascript"></script>

    <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-code-settings-form" method="post">
        <iproov-me token="${token}" base_url="https://latam.rp.secure.iproov.me"></iproov-me>
            <div id="kc-form-buttons" class="card__button-container" style="text-align: center;">
                <input hidden  name="iproov-result" id="iproov-result" type="String" value="passed"/>
                <input style="width: 75%; cursor: pointer;" name="kc-submit" id="kc-submit" type="submit" value="submit"/>
            </div>
    </form>
    
    </#if>
</@layout.registrationLayout>