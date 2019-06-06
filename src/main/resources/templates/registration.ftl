<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<h2>Add new user</h2>
    ${message?if_exists}
<@l.login "/registration"/>
</@c.page>