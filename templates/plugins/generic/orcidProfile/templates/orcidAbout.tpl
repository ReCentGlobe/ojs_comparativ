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

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="plugins.generic.orcidProfile.about.title"}
		<h1 class="text-2xl font-bold text-white mt-0">{translate key="plugins.generic.orcidProfile.about.title"}</h1>
	</div>
</section>
<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="w-full max-w-xl mx-auto">
			<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.orcidExplanation"}</p>
			<h3 class="text-lg font-semibold mb-2">{translate key="plugins.generic.orcidProfile.about.howAndWhy.title"}</h3>
			{if $isMemberApi}
				<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.howAndWhyMemberAPI"}</p>
			{else}
				<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.howAndWhyPublicAPI"}</p>
			{/if}
			<h3 class="text-lg font-semibold mb-2">{translate key="plugins.generic.orcidProfile.about.display.title"}</h3>
			<p class="mb-4 text-gray-700">{translate key="plugins.generic.orcidProfile.about.display"}</p>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
