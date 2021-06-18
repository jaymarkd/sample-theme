<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html >
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Flight Deck">
    <meta name="keywords" content="Flight, Deck, Cloudstaff, Innovation, Labs, Development">
    <meta name="author" content="Withinpixels">
    <link href="${url.resourcesPath}/img/cloudstaff.svg" rel="icon"/>

    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

	<body>
        <#nested "header">
        <div class="login-content" style="background-image: url(&quot;${url.resourcesPath}/img/dark-material-bg.jpg&quot;);">
            <div class="box">
        <#if displayMessage && message?has_content>
        <div class="alert alert-${message.type}" style="text-align:center;">
             <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
             <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
             <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
             <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
             <span class="message-text">${message.summary?no_esc}</span>
        </div>
        </#if>
        <#nested "form">
            </div> 
        </div>
	</body>
</html>
</#macro>
