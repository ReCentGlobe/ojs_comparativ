{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()}

<section class="bg-primary py-8">
	<div class="container mx-auto">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$announcement->getLocalizedTitle()}
		<h1 class="text-2xl font-light text-white mt-0">Press</h1>
	</div>
</section>

<section class="py-8 page page_announcement">
	<div class="container mx-auto">
		<div class="grid">
			<div class="col-span-1">
				{* Display book details *}
				{include file="frontend/objects/announcement_full.tpl"}
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
