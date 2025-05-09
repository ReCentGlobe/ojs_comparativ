{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="page_index_site max-w-5xl mx-auto py-8">

	{if $about}
		<div class="about_site mb-8 text-gray-700">
			{$about|nl2br}
		</div>
	{/if}

	<div class="journals">
		<h2 class="text-xl font-bold mb-4">
			{translate key="journal.journals"}
		</h2>
		{if !count($journals)}
			{translate key="site.noJournals"}
		{else}
				<ul class="grid gap-8 md:grid-cols-2">
				{foreach from=$journals item=journal}
					{capture assign="url"}{url journal=$journal->getPath()}{/capture}
					{assign var="thumb" value=$journal->getLocalizedSetting('journalThumbnail')}
					{assign var="description" value=$journal->getLocalizedDescription()}
					<li{if $thumb} class="has_thumb"{/if}>
						{if $thumb}
							{assign var="altText" value=$journal->getLocalizedSetting('journalThumbnailAltText')}
							<div class="thumb mb-2">
								<a href="{$url|escape}">
									<img src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $altText} alt="{$altText|escape}"{/if} class="rounded shadow w-32 h-32 object-cover">
								</a>
							</div>
						{/if}

						<div class="body">
							<h3 class="text-lg font-semibold mb-1">
								<a href="{$url|escape}" rel="bookmark" class="text-primary hover:underline">
									{$journal->getLocalizedName()}
								</a>
							</h3>
							{if $description}
								<div class="description text-gray-600 mb-2">
									{$description|nl2br}
								</div>
							{/if}
							<ul class="links flex gap-4 text-sm">
								<li class="view">
									<a href="{$url|escape}" class="text-accent hover:underline">
										{translate key="site.journalView"}
									</a>
								</li>
								<li class="current">
									<a href="{url|escape journal=$journal->getPath() page="issue" op="current"}" class="text-accent hover:underline">
										{translate key="site.journalCurrent"}
									</a>
								</li>
							</ul>
						</div>
					</li>
				{/foreach}
			</ul>

			{if $journals->getPageCount() > 0}
				<div class="cmp_pagination mt-8">
					{page_info iterator=$journals}
					{page_links anchor="journals" name="journals" iterator=$journals}
				</div>
			{/if}
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
