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

<section class="hero is-primary">
	<div class="hero-body">
		<div class="container">
			{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$announcement->getLocalizedTitle()}
			<h1 class="title has-text-weight-light">
				Press
			</h1>
		</div>
	</div>
</section>

<section class="section page page_announcement">
	<div class="container">
		<div class="columns">
			<div class="column content">
				{* Display book details *}
				{include file="frontend/objects/announcement_full.tpl"}	</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
