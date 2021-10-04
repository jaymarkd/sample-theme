<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",('Flight Deck'))}
    <#elseif section = "header">

    <#elseif section = "form">

        <#if realm.password>

            <h2>Forgot Password</h2>
            <form onsubmit="return true;" action="${url.loginAction}" method="post">
                <div class="form-group mb-3">
                        <label class="form-label" for="username">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}
                    <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                    <#else>${msg("email")}</#if>
                    </label>
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username"  placeholder="Enter email address" class="form-control" autofocus value="${auth.attemptedUsername}"/>
                    <#else>
                        <input type="text" id="username" name="username"  placeholder="Enter email address" class="form-control" autofocus/>
                    </#if>
                    <!-- <div class="invalid-feedback">Invalid Email</div> -->
                </div>
                <div class="buttons d-flex flex-row justify-content-end align-items-center mb-5">
                    <input class="btn btn-primary btn-login" type="submit" value="${msg("doSubmit")}" >
                </div>
            </form>
            <a href="${url.loginUrl}" class="back-to-login">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        

        </#if>

       
    </#if>
</@layout.registrationLayout>
