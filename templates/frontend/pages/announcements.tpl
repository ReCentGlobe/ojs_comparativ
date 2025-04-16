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

<section class="bg-primary py-8">
	<div class="container mx-auto">
      {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="announcement.announcements"}
		<h1 class="text-2xl font-light text-white mt-0">Press</h1>
	</div>
</section>

<section class="py-8 page page_announcements">
	<div class="container mx-auto">

    {include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="announcements" sectionTitleKey="announcement.announcements"}

		<div class="grid gap-8 mb-12 md:grid-cols-2 lg:grid-cols-3">


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
