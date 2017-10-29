<#--
    article.ftl: format the articel structure
    
    Created:    2017-10-29 14:19 by Christian Berndt
    Modified:   2017-10-29 14:19 by Christian Berndt
    Version:    1.0.0
-->

<#assign cssStyle = "col-sm-8 col-sm-offset-2" />
<#assign displayToc = getterUtil.getBoolean(showToc.getData(), false) />

<#if displayToc>
    <#assign cssStyle = "col-sm-8" />
</#if>

<div class="article row">
    <div class="${cssStyle}">
        
        <h1>Frequently Asked Questions</h1>
        
        <#if section.getSiblings()?has_content>
            <#list section.getSiblings() as cur_section>
                <h2>${cur_section.getData()}</h2>
                <#if cur_section.text??>
                    <#if cur_section.text.getData()?has_content>
                        <p class="lead">
                            ${cur_section.text.getData()}
                        </p>
                    </#if>
                </#if>
            </#list>
        </#if>
    </div>
</div>