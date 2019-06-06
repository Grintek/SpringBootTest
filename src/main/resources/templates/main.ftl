<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div>
        <@l.logaut/>
    </div>
    <div>
        <form method="post" action="add">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Tэг">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Записать</button>
        </form>
    </div>
    <div><h3>Список сообщений</h3></div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?if_exists  }">
        <button type="submit">НАЙТИ</button>
    </form>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>

        </div>
    <#else>
        No message
    </#list>
</@c.page>