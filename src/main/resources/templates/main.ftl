<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div>
        <@l.logaut/>
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" action="add" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Tэг">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Записать</button>
        </form>
    </div>
    <hr>
    <div>
        <form method="post" action="addchan">
            <input type="text" name="chn_url" placeholder="Введи ссылку на видео">
            <input type="text" name="name" placeholder="Название">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">добавить</button>
        </form>
    </div>
    <div><h3>Список сообщений</h3></div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists  }">
        <button type="submit">НАЙТИ</button>
    </form>
    <#list messages?ifExists as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</@c.page>