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

<div class="cmp_skip_to_content sr-only">
	<a href="#pkp_content_main">{translate key="navigation.skip.main"}</a>
	<a href="#pkp_content_nav">{translate key="navigation.skip.nav"}</a>
	<a href="#pkp_content_footer">{translate key="navigation.skip.footer"}</a>
</div>
<div class="relative z-10">

	{* Sidebars *}
		{call_hook name="Templates::Common::Sidebar"}
		{if $sidebarCode}
			{$sidebarCode}
		{/if}

	{* Primary site navigation *}
	{if $currentContext}
		<header class="fixed top-0 left-0 w-full z-50 bg-white border-b border-gray-100 text-gray-900 shadow-sm">
			<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
				<div class="flex justify-between h-16 items-center">
					<div class="flex items-center gap-4">
						{capture assign="homeUrl"}
							{url page="index" router=$smarty.const.ROUTE_PAGE}
						{/capture}
						{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
							<a href="{$homeUrl}" class="block">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:'url'}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} class="h-12 w-auto"/>
							</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="text-xl font-bold text-primary">{$displayPageHeaderTitle|escape}</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="block">
								<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:'url'}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" class="h-12 w-auto"/>
							</a>
						{else}
							<a href="{$homeUrl}" class="block">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" class="h-12 w-auto"/>
							</a>
						{/if}
					</div>
					<nav class="hidden md:flex md:items-center md:gap-6">
						{load_menu name="primary" id="navigationPrimary" ulClass="flex gap-6 items-center text-base font-medium text-primary" liClass="hover:text-accent transition-colors"}
					</nav>
					<div class="flex items-center gap-4">
						{* Search form *}
						<form class="hidden md:block" action="{url page="search" op="search"}" method="post" role="search" autocomplete="on">
							<input class="rounded px-2 py-1 text-gray-900 border border-gray-200 focus:border-primary" name="query" type="search" placeholder="Search..." value="{$searchQuery|escape}" aria-label="{translate|escape key="common.searchQuery"}">
						</form>
						<span class="hidden md:inline">{load_menu name="user" id="navigationUser" ulClass="flex gap-4 items-center" liClass="profile"}</span>
						<button id="mobile-menu-toggle" class="md:hidden flex items-center px-2 py-1 border border-gray-300 rounded text-primary hover:text-accent hover:border-accent focus:outline-none" aria-label="Open menu" onclick="document.getElementById('mobile-menu').classList.toggle('hidden')">
							<svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
						</button>
					</div>
				</div>
			</div>
			<div id="mobile-menu" class="md:hidden hidden bg-white border-t border-gray-100">
				<div class="px-4 pt-2 pb-4 space-y-2">
					{load_menu name="primary" id="navigationPrimaryMobile" ulClass="flex flex-col gap-2 text-primary" liClass="hover:text-accent transition-colors"}
					<form class="mt-2" action="{url page="search" op="search"}" method="post" role="search" autocomplete="on">
						<input class="rounded px-2 py-1 w-full text-gray-900 border border-gray-200 focus:border-primary" name="query" type="search" placeholder="Search..." value="{$searchQuery|escape}" aria-label="{translate|escape key="common.searchQuery"}">
					</form>
					{load_menu name="user" id="navigationUserMobile" ulClass="flex flex-col gap-2" liClass="profile"}
				</div>
			</div>
		</header>
	{/if}

	{* Wrapper for page content and sidebars *}
	{if $isFullWidth}
		{assign var=hasSidebar value=0}
	{/if}
	<div id="pkp_content_main" role="main" class="pt-16{if $hasSidebar} has_sidebar{/if}">

