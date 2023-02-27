{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Editorial Team
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1">
				{$currentContext->getLocalizedSetting('editorialTeam')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.editorialTeam"}
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
