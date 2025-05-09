{**
 * templates/frontend/pages/message.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Generic message page.
 * Displays a simple message and (optionally) a return link.
 *}
{include file="frontend/components/header.tpl"}

<section class="bg-primary py-8">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
		<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
			{translate key=$pageTitle}
		</h1>
	</div>
</section>

<section class="bg-white py-8">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="description text-gray-700 mb-6">
			{if $messageTranslated}
				{$messageTranslated}
			{else}
				{translate key=$message}
			{/if}
		</div>
		{if $backLink}
			<div class="cmp_back_link mt-4">
				<a href="{$backLink}" class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition">{translate key=$backLinkLabel}</a>
			</div>
		{/if}
	</div>
</section>

{include file="frontend/components/footer.tpl"}
