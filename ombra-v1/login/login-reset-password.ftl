<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",('Ombra'))}
    <#elseif section = "header">
       <header>
            <div class="d-flex flex-row justify-content-between align-items-center">
                <h1 class="fs-5 text-light fw-light">Login</h1>
                <img src="${url.resourcesPath}/img/cs_logo.png" alt="Cloudstaff" class="logo">
            </div>
        </header>
    <#elseif section = "form">

        <#if realm.password>

            <div class="content">
                <div class="login">
                    <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <#if auth?has_content && auth.showUsername()>
                                    <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}"/>
                                <#else>
                                    <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus/>
                                </#if>
                            </div>
                        </div>
                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                                </div>
                            </div>

                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </#if>
        <#--  <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style zocial-${p.alias}" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>  -->
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
