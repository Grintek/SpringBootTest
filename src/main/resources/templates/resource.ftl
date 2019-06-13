<#import "parts/common.ftl" as c>

<@c.page>
    <div>
        <h1>${user}</h1>

        <h5 style="color: aquamarine; border-color: black; border-style: solid; width: 10%">${name}</h5>
    </div>
    <hr>
    <h1>Channel</h1>
    <div>
        <#list channel as chann>
            <h2>name:${chann.name}</h2>

            <iframe width="560" height="315" src="${chann.chnUrl}"
                    frameborder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
        </#list>

    </div>
</@c.page>