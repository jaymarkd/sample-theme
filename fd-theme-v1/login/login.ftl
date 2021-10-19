<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",('Flight Deck'))}
    <#elseif section = "header">

    <#elseif section = "form">

        <#if realm.password>
  
                      
            <h2>Login</h2>
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
                </div>
                <div class="form-group mb-5">
                    <label class="form-label" for="typePassword">Password</label>
                    <input type="password" name="password" id="typePassword" class="form-control" placeholder="${msg("password")}"/>
                    <!-- <div class="invalid-feedback">Invalid Email</div> -->
                </div>

                <div class="buttons d-flex flex-row justify-content-between align-items-center mb-5">
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="d-flex flex-row justify-content-start align-items-center ">
                            <div class="">
                                <#if login.rememberMe??>
                                    <input type="checkbox" id="checkbox rememberMe" name="rememberMe" checked>
                                    <label for="checkbox"></label>
                                <#else>
                                    <input type="checkbox" id="checkbox rememberMe" name="rememberMe" >
                                    <label for="checkbox"></label>
                                </#if>
                            </div>
                            <div class="label ms-2"> ${msg("rememberMe")}</div>
                        </div>
                    </#if>
                    
                    <input onClick="this.form.submit(); this.disabled=true;" class="btn btn-primary btn-login" type="submit" value="${msg("doLogIn")}" >
                </div>
                    <#if realm.resetPasswordAllowed>
                <div class="fforgot-password text-center mb-5">
                    <a href="${url.loginResetCredentialsUrl}">FORGOT PASSWORD</a>
                </div>
                </#if>

                <#if realm.password && social.providers??>
                <p class="text-center my-3 middle-text">OR LOGIN WITH</p>
                <div class="links d-flex flex-wrap justify-content-evenly">
                    <#list social.providers as p>
                    <button onclick="location.href='${p.loginUrl}';" type="button" class="btn btn-link d-flex justify-content-center align-items-center" data-mdb-color="dark">
                    <a class="zocial ${p.providerId}" onclick="event.preventDefault();"> <span >${p.displayName}</span></a>
                    </button>
                    </#list>
                </div>
                </#if>
            </form>


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
