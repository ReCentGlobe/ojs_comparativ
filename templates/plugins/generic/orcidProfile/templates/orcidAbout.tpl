{**
 * plugins/generic/orcidProfile/templates/orcidVerify.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2000-2019 John Willinsky
 * Copyright (c) 2018-2019 University Library Heidelberg
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Page template to display from the OrcidHandler to show ORCID verification success or failure.
 *}
{include file="frontend/components/header.tpl"}

{capture assign="breadcrumbsHtml"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="plugins.generic.orcidProfile.about.title"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="plugins.generic.orcidProfile.about.title"}}

<section class="bg-white py-12">
	<div class="container max-w-2xl mx-auto">
		<div class="w-full">
			<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.orcidExplanation"}</p>
			<h3 class="text-lg font-bold border-b border-gray-200 pb-2 mb-4">{translate key="plugins.generic.orcidProfile.about.howAndWhy.title"}</h3>
			{if $isMemberApi}
				<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.howAndWhyMemberAPI"}</p>
			{else}
				<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.howAndWhyPublicAPI"}</p>
			{/if}
			<h3 class="text-lg font-bold border-b border-gray-200 pb-2 mb-4">{translate key="plugins.generic.orcidProfile.about.display.title"}</h3>
			<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.display"}</p>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
