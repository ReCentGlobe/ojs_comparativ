{**
 * templates/frontend/pages/editorialHistory.tpl
 *
 * Copyright (c) 2024 Simon Fraser University
 * Copyright (c) 2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial history page (OJS 3.5+). The former
 *  "Editorial Team" text is migrated into the editorialHistory setting.
 *
 * @uses $mastheadRoles array User groups shown on the masthead
 * @uses $mastheadUsers array Former users per masthead role id
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialHistory"}

{capture assign="breadcrumbsHtml"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.editorialHistory"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="common.editorialHistory.page"}}

<section class="bg-white py-8">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 animate-fadeIn">
		<p class="text-gray-700 mb-6">{translate key="common.editorialHistory.page.description"}</p>

		{foreach from=$mastheadRoles item="mastheadRole"}
			{if array_key_exists($mastheadRole->id, $mastheadUsers)}
				<h2 class="font-sans text-xl font-semibold text-primary border-b border-gray-200 pb-2 mb-4 mt-8">{$mastheadRole->getLocalizedData('name')|escape}</h2>
				<ul class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4" role="list">
					{foreach from=$mastheadUsers[$mastheadRole->id] item="mastheadUser"}
						<li class="bg-gray-50 border border-gray-200 rounded-md p-4">
							<span class="name block font-serif text-lg text-primary">
								{$mastheadUser['user']->getFullName()|escape}
								{if $mastheadUser['user']->getData('orcid') && $mastheadUser['user']->hasVerifiedOrcid()}
									<a href="{$mastheadUser['user']->getData('orcid')|escape}" target="_blank" class="orcid inline-block align-middle ml-1" aria-label="{translate key="common.editorialHistory.page.orcidLink" name=$mastheadUser['user']->getFullName()|escape}">{$orcidIcon}</a>
								{/if}
							</span>
							{if !empty($mastheadUser['user']->getLocalizedData('affiliation'))}
								<span class="affiliation block text-sm text-gray-600">{$mastheadUser['user']->getLocalizedData('affiliation')|escape}</span>
							{/if}
							<span class="date_start block text-xs text-gray-500 mt-1">
								{foreach name="services" from=$mastheadUser['services'] item="service"}
									{translate key="common.fromUntil" from=$service['dateStart'] until=$service['dateEnd']}{if !$smarty.foreach.services.last}{translate key="common.commaListSeparator"}{/if}
								{/foreach}
							</span>
						</li>
					{/foreach}
				</ul>
			{/if}
		{/foreach}

		<div class="mt-8 prose prose-xl font-serif max-w-full prose-h2:font-sans prose-h2:text-xl prose-a:text-accent prose-a:underline hover:prose-a:text-accent-dark">
			{$currentContext->getLocalizedData('editorialHistory')}
			{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="common.editorialHistory"}
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
