<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=true displayInfo=false>
    <h1>Verificación de Código</h1>

    <#if generated_code??>
        <p>Tu código de verificación es: <strong>${generated_code}</strong></p>
    </#if>

    <form action="${url.loginAction}" method="post">
        <#-- Campo de usuario -->
        <div class="form-group">
            <label for="username">Usuario</label>
            <input type="text" id="username" name="username" class="form-control" required autofocus />
        </div>

        <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="password" id="password" name="password" class="form-control" required />
        </div>

        <div class="form-group">
            <label for="auth_code">Código de verificación</label>
            <input type="text" id="auth_code" name="auth_code" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary">Verificar</button>
    </form>

</@layout.registrationLayout>
