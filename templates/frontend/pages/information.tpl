{**
 * templates/frontend/pages/information.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Information page.
 *
 *}
{if !$contentOnly}
	{include file="frontend/components/header.tpl" pageTitle=$pageTitle}
{/if}

<div class="page page_information max-w-3xl mx-auto py-8">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="information" sectionTitleKey="manager.website.information"}

	<div class="description text-gray-700">
		{$content}
	</div>
</div>

{if !$contentOnly}
	{include file="frontend/components/footer.tpl"}
{/if}
