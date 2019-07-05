<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <a class="btn btn-primary mb-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Добавить новую запись
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group">
            <form method="post" action="add" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Введите сообщение">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tэг">
                </div>
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary mt-2">Записать</button>
            </form>
        </div>
    </div>
    <hr>
    <div class="collapse" id="collapseExample">
        <div class="form-group">
            <form method="post" action="addchan">
                <div class="form-group">
                    <input type="text" class="form-control" name="chn_url" placeholder="Введи ссылку на видео">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="Название">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">добавить</button>
            </form>
        </div>
    </div>
    <div><h3>Список сообщений</h3></div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists  }"
                       placeholder="найти по тегу">
                <button type="submit" class="btn btn-primary ml-2">Найти</button>
            </form>
        </div>
    </div>

    <div class="card-columns">
    <#list messages?ifExists as message>
        <div class="card my-3">
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
    </div>
</@c.page>