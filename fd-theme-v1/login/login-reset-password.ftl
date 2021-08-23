<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",('Flight Deck'))}
    <#elseif section = "header">

    <#elseif section = "form">

        <#if realm.password>
            <div class="content">
                <div class="login d-flex justify-content-between align-items-stretch">
                    <div class="login-left-panel col-6 d-flex justify-content-center align-content-center">
                        <img src="${url.resourcesPath}/img/cs_logo.png" alt="Cloudstaff">
                    </div>
                    <div class="login-right-panel col-12 col-md-6">
                        <h1 class="d-flex justify-content-start align-items-center"><img src="${url.resourcesPath}/img/fd_logo.png" alt="flight deck"><span>FlightDeck</span></h1>
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
                    </div>
                </div>
            </div>

        </#if>

       
    </#if>
</@layout.registrationLayout>
