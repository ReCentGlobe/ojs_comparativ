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
			{translate key="plugins.generic.orcidProfile.about.title"}
		</h1>

	</div>

</section>
<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1">
				<p class="description">
					{translate key="plugins.generic.orcidProfile.about.orcidExplanation"}
				</p>
				<h3>{translate key="plugins.generic.orcidProfile.about.howAndWhy.title"}</h3>

				{if $isMemberApi}
					<p class="description">
					{translate key="plugins.generic.orcidProfile.about.howAndWhyMemberAPI"}
				</p>
				{else}
					<p class="description">
						{translate key="plugins.generic.orcidProfile.about.howAndWhyPublicAPI"}
					</p>
				{/if}

				<h3>{translate key="plugins.generic.orcidProfile.about.display.title"}</h3>
				<p class="description">
					{translate key="plugins.generic.orcidProfile.about.display"}
				</p>
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
