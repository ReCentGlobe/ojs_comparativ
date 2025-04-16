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

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}
		<h1 class="text-2xl font-bold text-white mt-0">Editorial Team</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="grid">
			<div class="col-span-1">
				{$currentContext->getLocalizedSetting('editorialTeam')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.editorialTeam"}
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
