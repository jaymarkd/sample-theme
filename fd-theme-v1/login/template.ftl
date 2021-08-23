<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html >
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Flight Deck">
    <meta name="keywords" content="Flight, Deck, Cloudstaff, Innovation, Labs, Development">
    <meta name="author" content="InnoLabs">
    <link href="${url.resourcesPath}/img/cloudstaff.svg" rel="icon"/>

    <title><#nested "title"></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet"
    />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

	<body>
        <#nested "header">

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

	</body>
</html>
</#macro>
