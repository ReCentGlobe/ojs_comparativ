{**
 * templates/frontend/pages/editorialMasthead.tpl
 *
 * Copyright (c) 2024 Simon Fraser University
 * Copyright (c) 2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial masthead page (OJS 3.5+).
 *
 * @uses $mastheadRoles array User groups shown on the masthead
 * @uses $mastheadUsers array Users per masthead role id
 * @uses $reviewers Collection Reviewers of the previous year
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialMasthead"}

{capture assign="breadcrumbsHtml"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.editorialMasthead"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="common.editorialMasthead"}}

<section class="bg-white py-8">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 animate-fadeIn">
		{foreach from=$mastheadRoles item="mastheadRole"}
			{if array_key_exists($mastheadRole->id, $mastheadUsers)}
				<h2 class="font-sans text-xl font-semibold text-primary border-b border-gray-200 pb-2 mb-4 mt-8 first:mt-0">{$mastheadRole->getLocalizedData('name')|escape}</h2>
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
						{if !empty($mastheadUser['dateStart'])}
							<span class="date_start block text-xs text-gray-500 mt-1">{translate key="common.fromUntil" from=$mastheadUser['dateStart'] until=""}</span>
						{/if}
					</li>
				{/foreach}
				</ul>
			{/if}
		{/foreach}

		<p class="mt-8 text-gray-700 [&_a]:text-accent [&_a]:underline">
			{capture assign=editorialHistoryUrl}{url page="about" op="editorialHistory" router=PKP\core\PKPApplication::ROUTE_PAGE}{/capture}
			{translate key="about.editorialMasthead.linkToEditorialHistory" url=$editorialHistoryUrl}
		</p>

		{if $reviewers->count()}
			<h2 class="font-sans text-xl font-semibold text-primary border-b border-gray-200 pb-2 mb-4 mt-8">{translate key="common.editorialMasthead.peerReviewers"}</h2>
			<p class="text-gray-700 mb-4">{translate key="common.editorialMasthead.peerReviewers.description" year=$previousYear}</p>
			<ul class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-x-4 gap-y-2" role="list">
			{foreach from=$reviewers item="reviewer"}
				<li>
					<span class="name font-serif text-primary">
						{$reviewer->getFullName()|escape}
						{if $reviewer->getData('orcid') && $reviewer->hasVerifiedOrcid()}
							<a href="{$reviewer->getData('orcid')|escape}" target="_blank" class="orcid inline-block align-middle ml-1" aria-label="{translate key="common.editorialHistory.page.orcidLink" name=$reviewer->getFullName()|escape}">{$orcidIcon}</a>
						{/if}
					</span>
					{if !empty($reviewer->getLocalizedData('affiliation'))}
						<span class="affiliation text-sm text-gray-600">– {$reviewer->getLocalizedData('affiliation')|escape}</span>
					{/if}
				</li>
			{/foreach}
			</ul>
		{/if}
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
