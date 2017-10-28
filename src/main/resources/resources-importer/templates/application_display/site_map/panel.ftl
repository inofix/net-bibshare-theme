<#--
    panel.ftl: application display template for the site-map portlet.
    
    Created:    2017-10-16 23:27 by Christian Berndt
    Modified:   2017-10-16 23:27 by Christian Berndt
    Version:    1.0.0
-->

<div class="panel panel-default">
    <div class="panel-heading">
        <strong><@liferay.language key="sitemap" /></strong>
    </div>
    <#if entries?has_content>
        <ul class="list-group">
            <#list entries as curPage>
                <li class="list-group-item">
                    <strong><a href="${curPage.getFriendlyURL(locale)}">${curPage.getName(locale)}</a></strong>                    
                </li>
            </#list>
        </ul>
    </#if>
</div>