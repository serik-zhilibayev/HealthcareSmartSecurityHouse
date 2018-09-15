<#import "parts/common.ftl" as c>
<#import "parts/forms.ftl" as l>

<@c.page>
    ${message?ifExists}
    <@l.auth "/login" false/>
</@c.page>
