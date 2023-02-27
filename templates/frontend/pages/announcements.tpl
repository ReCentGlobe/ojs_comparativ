{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the latest announcements
 *
 * @uses $announcements array List of announcements
 *}
{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}

<section class="hero is-primary">
	<div class="hero-body">
		<div class="container">
      {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="announcement.announcements"}
			<h1 class="title has-text-weight-light">
				Press
			</h1>
		</div>
	</div>
</section>

<section class="section page page_announcements">
	<div class="container">

    {include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="announcements" sectionTitleKey="announcement.announcements"}

		<div uk-grid class="uk-grid-large uk-grid-margin-large uk-grid uk-grid-match">


			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration <= 3}
					{include file="frontend/objects/announcement_front.tpl" heading="h2 class='subtitle'"}
				{/if}
			{/foreach}

		</div>


    {$announcementsIntroduction}

    {include file="frontend/components/announcements.tpl"}

	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
