{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

<div class="cmp_skip_to_content">
	<a href="#pkp_content_main">{translate key="navigation.skip.main"}</a>
	<a href="#pkp_content_nav">{translate key="navigation.skip.nav"}</a>
	<a href="#pkp_content_footer">{translate key="navigation.skip.footer"}</a>
</div>
<div class="uk-position-relative uk-position-z-index">

	{* Sidebars *}
	{if empty($isFullWidth)}
		{*			{call_hook|assign:"sidebarCode" name="Templates::Common::Sidebar"}*}
		{call_hook name="Templates::Common::Sidebar"}
		{if $sidebarCode}
			{$sidebarCode}
		{/if}
	{/if}

	{* Primary site navigation *}
	{if $currentContext}

		<div class="uk-visible@s" uk-header>
			<div uk-sticky  media="768" animation="uk-animation-fade" cls-active="uk-navbar-sticky" sel-target=".uk-navbar-container" cls-inactive="uk-dark">
				<div class="uk-navbar-container com-navbar-container uk-navbar-transparent uk-navbar-primary uk-background-secondary uk-box-shadow-small">
					<div class="uk-container">
						<nav uk-navbar>
							<div class="uk-navbar-left nav-overlay">
								{capture assign="homeUrl"}
									{url page="index" router=$smarty.const.ROUTE_PAGE}
								{/capture}

								{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
									<a href="{$homeUrl}" class="is_img">
										<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} style="
    width: 200px;
"/>
									</a>
								{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
									<a href="{$homeUrl}" class="is_text">
										<span>{$displayPageHeaderTitle|escape}</span>
									</a>
								{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
									<a href="{$homeUrl}" class="is_img">
										<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
									</a>
								{else}
									<a href="{$homeUrl}" class="is_img">
										<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
									</a>
								{/if}

								{*								{if $currentContext && $multipleContexts}
																	{url|assign:"homeUrl" journal="index" router=$smarty.const.ROUTE_PAGE}
																{else}
																	{url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
																{/if}
																{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
																	<a href="{$homeUrl}" class="uk-navbar-item uk-logo uk-padding-small">
																		<img class="uk-responsive-height uk-responsive-width" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
																	</a>
																{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
																	<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle}</a>
																{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
																	<a href="{$homeUrl}" class="is_img">
																		<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
																	</a>
																{else}
																	<a href="{$homeUrl}" uk-img class="uk-navbar-item uk-logo">
																		<img data-src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
																	</a>
																{/if}*}

								{load_menu name="primary" id="navigationPrimary" ulClass="uk-navbar-nav"}
							</div>

							<div class="nav-overlay uk-navbar-left uk-flex-1" hidden>

								<div class="uk-navbar-item uk-width-expand">
									<form class="uk-search uk-search-navbar uk-width-1-1" action="{url page="search" op="search"}" method="post" role="search" autocomplete="on">
										<input class="uk-search-input" name="query" type="search" placeholder="Search..." autofocus value="{$searchQuery|escape}" aria-label="{translate|escape key="common.searchQuery"}">
									</form>
								</div>

								<a class="uk-navbar-toggle" uk-close uk-toggle="target: .nav-overlay; animation: uk-animation-fade" href="#"></a>

							</div>

							<div class="uk-navbar-right">
								{* Search form *}
								{include file="frontend/components/searchForm_simple.tpl"}
								{load_menu name="user" id="navigationUser" ulClass="uk-navbar-nav" liClass="profile"}
							</div>
						</nav>
					</div>

				</div><div class="uk-navbar-dropbar uk-navbar-dropbar-slide"></div>

			</div><div class="uk-sticky-placeholder" style="height: 80px; margin: 0px;" hidden=""></div>
		</div>
		<div class="uk-header-mobile uk-hidden@s" uk-header>
			<nav class="uk-navbar-container uk-navbar-transparent uk-navbar-primary uk-background-secondary uk-box-shadow-small" uk-navbar>
				<div class="uk-navbar-left">
					{capture assign="homeUrl"}
						{url page="index" router=$smarty.const.ROUTE_PAGE}
					{/capture}

					{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
						<a href="{$homeUrl}" class="is_img">
							<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
						</a>
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
						<a href="{$homeUrl}" class="is_text">
							<span>{$displayPageHeaderTitle|escape}</span>
						</a>
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
						<a href="{$homeUrl}" class="is_img">
							<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
						</a>
					{else}
						<a href="{$homeUrl}" class="is_img">
							<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
						</a>
					{/if}
					{*						{if $currentContext && $multipleContexts}
												{url|assign:"homeUrl" journal="index" router=$smarty.const.ROUTE_PAGE}
											{else}
												{url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
											{/if}
											{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
												<a href="{$homeUrl}" class="uk-navbar-item uk-logo uk-padding-small">
													<img class="uk-responsive-height uk-responsive-width" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
												</a>
											{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
												<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle}</a>
											{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
												<a href="{$homeUrl}" class="is_img">
													<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
												</a>
											{else}
												<a href="{$homeUrl}" uk-img class="uk-navbar-item uk-logo">
													<img data-src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
												</a>
											{/if}*}
				</div>

				<div class="uk-navbar-right">
					<a class="uk-navbar-toggle" href="#offcanvas-nav-primary" uk-toggle>
						<div uk-navbar-toggle-icon="" class="uk-navbar-toggle-icon uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><rect y="9" width="20" height="2"></rect><rect y="3" width="20" height="2"></rect><rect y="15" width="20" height="2"></rect></svg></div>
					</a>
				</div>
			</nav>
		</div>

		<div id="offcanvas-nav-primary" class="uk-hidden@s" overlay flip uk-offcanvas="mode: reveal;">
			<div class="uk-offcanvas-bar uk-flex uk-flex-column">

				<div class="uk-child-width-1-1 uk-grid-stack" uk-grid>
					<div class="uk-first-column">
						<div class="uk-panel">


							{load_menu name="primary" id="" ulClass="uk-nav uk-nav-secondary" liClass="uk-link-reset uk-text-primary"}
							<ul class="uk-nav uk-nav-default"> <li class="uk-nav-divider"></li></ul>
							{load_menu name="user" id="navigationUser" ulClass="uk-nav uk-nav-default" liClass="profile"}

						</div>
					</div>
				</div>

			</div>
		</div>

	{/if}


	{* Wrapper for page content and sidebars *}
	{if $isFullWidth}
		{assign var=hasSidebar value=0}
	{/if}
	<div id="pkp_content_main" role="main" class="{if $hasSidebar} has_sidebar{/if}">

