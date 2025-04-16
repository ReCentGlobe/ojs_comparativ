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
		<h1 class="text-2xl font-bold text-white mt-0">{translate key="plugins.generic.orcidProfile.verify.title"}</h1>
	</div>
</section>
<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="w-full max-w-xl mx-auto">
			<div class="mb-6">
				{if $verifySuccess}
					<p class="mb-2"><span class="orcid"><a href="{$orcid|escape}" target="_blank">{$orcidIcon}{$orcid|escape}</a></span></p>
					<div class="bg-green-100 border-l-4 border-green-500 text-green-900 p-4 rounded mb-2">{translate key="plugins.generic.orcidProfile.verify.success"}</div>
					{if $sendSubmission}
						{if $sendSubmissionSuccess}
							<div class="bg-green-100 border-l-4 border-green-500 text-green-900 p-4 rounded mb-2">{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.success"}</div>
						{else}
							<div class="bg-red-100 border-l-4 border-red-500 text-red-900 p-4 rounded mb-2">{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.failure"}</div>
						{/if}
					{elseif $submissionNotPublished}
						<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-900 p-4 rounded mb-2">{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.notpublished"}</div>
					{/if}
				{else}
					<div class="bg-red-100 border-l-4 border-red-500 text-red-900 p-4 rounded mb-2">{translate key="plugins.generic.orcidProfile.verify.failure"}</div>
				{/if}
			</div>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
