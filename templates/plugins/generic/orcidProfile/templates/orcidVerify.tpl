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

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="plugins.generic.orcidProfile.about.title"}
		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			{translate key="plugins.generic.orcidProfile.verify.title"}
		</h1>

	</div>

</section>
<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1">
				<div class="description">
					{if $verifySuccess}
						<p>
							<span class="orcid"><a href="{$orcid|escape}" target="_blank">{$orcidIcon}{$orcid|escape}</a></span>
						</p>
						<div class="orcid-success">
							{translate key="plugins.generic.orcidProfile.verify.success"}
						</div>
						{if $sendSubmission}
							{if $sendSubmissionSuccess}
								<div class="orcid-success">
									{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.success"}
								</div>
							{else}
								<div class="orcid-failure">
									{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.failure"}
								</div>
							{/if}
						{elseif $submissionNotPublished}
							{translate key="plugins.generic.orcidProfile.verify.sendSubmissionToOrcid.notpublished"}
						{/if}
					{else}
						<div class="orcid-failure">
							{if $denied}
								{translate key="plugins.generic.orcidProfile.authDenied"}
							{elseif $authFailure}
								{translate key="plugins.generic.orcidProfile.authFailure"}
							{elseif $duplicateOrcid}
								{translate key="plugins.generic.orcidProfile.verify.duplicateOrcid"}
							{else}
								{translate key="plugins.generic.orcidProfile.verify.failure"}
							{/if}
						</div>
						{translate key="plugins.generic.orcidProfile.failure.contact"}
					{/if}
				</div>
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
