<#--
    panel.ftl: application display template for the tag-navigation portlet.
    
    Created:    2017-10-29 00:11 by Christian Berndt
    Modified:   2017-10-29 00:11 by Christian Berndt
    Version:    1.0.0
-->

<div class="panel panel-default">
    <div class="panel-heading">
        <strong><@liferay.language key="tags" /></strong>
    </div>
    <#if entries?has_content>
        <ul class="list-group">
            <#list entries as curTag>
                <li class="list-group-item">
                    <strong><a href="${curTag.name}">${curTag.name} (${curTag.assetCount})</a></strong>                    
                </li>
            </#list>
        </ul>
    </#if>
</div>