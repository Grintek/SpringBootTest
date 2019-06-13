<#import "parts/common.ftl" as c>

<@c.page>
    <h3>list of User</h3>


    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username?if_exists}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id?if_exists}">edit user</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>