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
                    <form onsubmit="return true;" action="${url.loginAction}" method="post">
                        <div class="form-group mb-3">
                             <label class="form-label" for="username">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>${msg("email")}</#if>
                             </label>
                            <#if usernameEditDisabled??>
                                <input placeholder="${msg("username")}" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input placeholder="${msg("usernameOrEmail")}" id="username" class="form-control" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                            </#if>
                            <!-- <div class="invalid-feedback">Invalid Email</div> -->
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label" for="typePassword">Password</label>
                            <input type="password" name="password" id="typePassword" class="form-control" placeholder="${msg("password")}"/>
                            <!-- <div class="invalid-feedback">Invalid Email</div> -->
                        </div>
                        <div class="d-flex flex-row justify-content-between align-items-center mb-2">

                            <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="d-flex flex-row justify-content-start align-items-center ">
                                <div class="round">
                                    <#if login.rememberMe??>
                                        <input type="checkbox" id="checkbox" name="rememberMe" checked>
                                        <label for="checkbox"></label>
                                    <#else>
                                        <input type="checkbox" id="checkbox" name="rememberMe" >
                                        <label for="checkbox"></label>
                                    </#if>
                                </div>
                                <div class="label ms-2"> ${msg("rememberMe")}</div>
                            </div>
                            </#if>
                            <input class="btn btn-primary btn-login" type="submit" value="${msg("doLogIn")}" >
                        </div>

                        <div class="forgot-password text-center">
                            <a href="${url.loginResetCredentialsUrl}">FORGOT PASSWORD</a>
                        </div>
                        <#if realm.password && social.providers??>
                        <p class="text-center my-3 middle-text">OR LOGIN WITH</p>
                        <div class="d-flex justify-content-between gx-3 links">
                            <#list social.providers as p>
                             <button onclick="location.href='${p.loginUrl}';" type="button" class="btn btn-link d-flex justify-content-center align-items-center" data-mdb-color="dark">
                              <a class="zocial ${p.providerId}" onclick="event.preventDefault();"> <span >${p.displayName}</span></a>
                            </button>
                             
                            </#list>
                        </div>
                        </#if>
                    </form>
                </div>
            </div>
            <footer>
                <div class="d-flex flex-row justify-content-between align-items-center">
                    <p class="my-0">Version 1.0 (64 Bit) • Contact Technical Support for urgent issues</p>
                    <p class="my-0"><a href="#" class="d-flex align-items-center"><span>Admin Close</span><span class="material-icons-outlined ms-1">logout</span></a></p>
                </div>
            </footer>

        </#if>
        <#--  <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style zocial-${p.alias}" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>  -->
       
    </#if>
</@layout.registrationLayout>
