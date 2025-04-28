{**
 * templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

{capture assign="breadcrumbsHtml"}
  {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutContext"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="about.aboutContext"}}

<section class="bg-white py-8">
	<div class="container max-w-7xl mx-auto">
		<div class="grid">
			<div class="col-span-1 animate-fadeIn prose prose-xl font-serif max-w-full prose-h2:font-sans prose-h2:text-xl prose-a:text-accent prose-a:underline hover:prose-a:text-accent-dark">
				{$currentContext->getLocalizedSetting('about')}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
