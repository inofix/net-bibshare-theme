<#--
    navigation.ftl: header navigation.
    
    Created:    2017-09-11 19:14 by Christian Berndt
    Modified:   2017-09-15 00:58 by Christian Berndt
    Version:    1.0.4
-->

<#assign home_url = htmlUtil.escape(theme_display.getURLHome()) />
<#assign is_impersonated = themeDisplay.isImpersonated() />

<#if !home_url?has_content>
    <#assign home_url = company_url />
</#if>

<#if is_impersonated>
    <#assign do_as_user_id = paramUtil.getString(request, "doAsUserId") />
    <#assign home_url = httpUtil.addParameter(home_url, "doAsUserId", do_as_user_id) />
</#if>

<nav class="${nav_css_class} navbar navbar-default" id="navigation" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".site-navigation" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
           
            <a class="navbar-brand ${logo_css_class}" href="${home_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                <img alt="${logo_description}" src="${company_logo}?v.1" />
            
                <#if show_site_name>
                    <span class="brand-name site-name" title="<@liferay.language_format arguments="${company_name}" key="go-to-x" />">
                        ${company_name}
                    </span>
                </#if>
            </a>

        </div>
        
            <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") /> 
            <#assign VOID = freeMarkerPortletPreferences.setValue("searchConfiguration", "{\"facets\":[{\"fieldName\":\"assetCategoryIds\",\"static\":false,\"data\":{\"displayStyle\":\"list\",\"maxTerms\":10,\"showAssetCount\":true,\"frequencyThreshold\":1},\"weight\":1.3,\"className\":\"com.liferay.portal.kernel.search.facet.MultiValueFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.AssetCategoriesSearchFacet\",\"label\":\"any-category\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"entryClassName\",\"static\":false,\"data\":{\"frequencyThreshold\":1,\"values\":[\"ch.inofix.referencemanager.model.Bibliography\",\"ch.inofix.referencemanager.model.Reference\"]},\"weight\":1.5,\"className\":\"com.liferay.portal.kernel.search.facet.AssetEntriesFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.AssetEntriesSearchFacet\",\"label\":\"any-asset\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"assetTagNames\",\"static\":false,\"data\":{\"displayStyle\":\"list\",\"maxTerms\":10,\"showAssetCount\":true,\"frequencyThreshold\":1},\"weight\":1.4,\"className\":\"com.liferay.portal.kernel.search.facet.MultiValueFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.AssetTagsSearchFacet\",\"label\":\"any-tag\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"folderId\",\"static\":false,\"data\":{\"maxTerms\":10,\"showAssetCount\":true,\"frequencyThreshold\":1},\"weight\":1.2,\"className\":\"com.liferay.portal.kernel.search.facet.MultiValueFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.FolderSearchFacet\",\"label\":\"any-folder\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"modified\",\"static\":false,\"data\":{\"ranges\":[{\"range\":\"[past-hour TO *]\",\"label\":\"past-hour\"},{\"range\":\"[past-24-hours TO *]\",\"label\":\"past-24-hours\"},{\"range\":\"[past-week TO *]\",\"label\":\"past-week\"},{\"range\":\"[past-month TO *]\",\"label\":\"past-month\"},{\"range\":\"[past-year TO *]\",\"label\":\"past-year\"}],\"frequencyThreshold\":1},\"weight\":1,\"className\":\"com.liferay.portal.kernel.search.facet.ModifiedFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.ModifiedSearchFacet\",\"label\":\"any-time\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"groupId\",\"static\":false,\"data\":{\"maxTerms\":10,\"showAssetCount\":true,\"frequencyThreshold\":1},\"weight\":1.6,\"className\":\"com.liferay.portal.kernel.search.facet.ScopeFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.ScopeSearchFacet\",\"label\":\"any-site\",\"order\":\"OrderHitsDesc\"},{\"fieldName\":\"userName\",\"static\":false,\"data\":{\"maxTerms\":10,\"showAssetCount\":true,\"frequencyThreshold\":1},\"weight\":1.1,\"className\":\"com.liferay.portal.kernel.search.facet.MultiValueFacet\",\"id\":\"com.liferay.portal.search.web.internal.facet.UserSearchFacet\",\"label\":\"any-user\",\"order\":\"OrderHitsDesc\"}]}") />     
                                
            <@liferay_portlet["runtime"]
                defaultPreferences="${freeMarkerPortletPreferences}"
                portletProviderAction=portletProviderAction.VIEW
                portletName="com_liferay_portal_search_web_portlet_SearchPortlet" />
    
            <#assign VOID = freeMarkerPortletPreferences.reset() />
 
        <ul aria-label="<@liferay.language key="site-pages" />" class="collapse nav navbar-collapse navbar-nav navbar-right site-navigation" role="menubar">
            <#list nav_items as nav_item>
                <#assign
                    data_toggle = ""
                    has_children = false 
                    nav_item_attr_has_popup = ""
                    nav_item_attr_selected = ""
                    nav_item_css_class = ""
                    nav_item_layout = nav_item.getLayout()
                    nav_link_css_class = ""
                />
                
                <#if nav_item.hasChildren()>
                    <#assign data_toggle = "data-toggle=\"dropdown\"" />                        
                    <#assign has_children = true />                        
                    <#assign nav_item_css_class = "dropdown"/>
                    <#assign nav_link_css_class = "dropdown-toggle"/>
                </#if>
                
    
                <#if nav_item.isSelected()>
                    <#assign
                        nav_item_attr_has_popup = "aria-haspopup='true'"
                        nav_item_attr_selected = "aria-selected='true'"
                        nav_item_css_class = nav_item_css_class + " active"
                    />
                </#if>
                
                <li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
                    <a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
                        <span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>
                    </a>
                    <#if has_children>
                        <a aria-labelledby="layout_${nav_item.getLayoutId()}" class="${nav_link_css_class}" ${nav_item_attr_has_popup} ${data_toggle} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
                            <span class="icon-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <#list nav_item.getChildren() as nav_child>
                                <#assign
                                    nav_child_attr_selected = ""
                                    nav_child_css_class = ""
                                />
    
                                <#if nav_item.isSelected()>
                                    <#assign
                                        nav_child_attr_selected = "aria-selected='true'"
                                        nav_child_css_class = "selected"
                                    />
                                </#if>
    
                                <li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
                                    <a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
                                </li>
                            </#list>
                        </ul>
                    </#if>                        
                </li>
                              
            </#list>

            <#if !is_signed_in >
                <li>
                    <a class="btn btn-default btn-sign-in" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">
                        <@liferay.language key="sign-in" />
                    </a>
                    <a class="btn btn-success btn-sign-up" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">
                        <@liferay.language key="sign-up" />
                    </a>
                </li>
            <#elseif sign_out_url??> <#-- sign_out_url is not available in impersonate mode -->
                <li>
                    <a class="btn btn-default btn-sign-out" href="${sign_out_url}" id="sign-out" rel="nofollow" title="<@liferay.language key="sign-out" />"><@liferay.language key="sign-out" /></a>
                </li>
            </#if>
            
            <li>
                <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />        
                                    
                <@liferay_portlet["runtime"]
                    defaultPreferences="${freeMarkerPortletPreferences}"
                    portletProviderAction=portletProviderAction.VIEW
                    instanceId="NAVIGATION_LANGUAGE"
                    portletName="com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet" />
        
                <#assign VOID = freeMarkerPortletPreferences.reset() />
            </li>           

        </ul>
    </div>
</nav>
