{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
<div class="obj_issue_toc uk-container">
    {iterate from=userInstitutionalSubscriptions item=userInstitutionalSubscription}
    {$userInstitutionalSubscription->getInstitutionName()|escape}
	{/iterate}

			{* Indicate if this is only a preview *}
		{if !$issue->getPublished()}
			<div class="notification">
				{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
			</div>
		{/if}


	<div class="uk-grid-large uk-flex-top uk-grid-margin-large" uk-grid>

		<div class="uk-width-2-3@m">

			<div class="issue description" uk-scrollspy-class>
				{* Description *}
				{if $issue->hasDescription()}
					<div class="description">
						{$issue->getLocalizedDescription()|strip_unsafe_html}
					</div>
				{/if}
			</div>

      {* Articles *}
			<div class="sections">
        {foreach name=sections from=$publishedSubmissions item=section}
					<div class="toc_section">
            			{if $section.articles}
             				 {if $section.title}
								<h4 class="uk-h4 uk-margin-large uk-heading-bullet" uk-scrollspy-class>
									 {$section.title|escape}
								</h4>
             				 {/if}
							{foreach from=$section.articles item=article}
								<article class="uk-margin-medium uk-margin-remove-top uk-panel uk-article" uk-scrollspy-class>
									{include file="frontend/objects/article_summary.tpl"}
									<hr>
								</article>
							{/foreach}
           				 {/if}
					</div>
        {/foreach}
			</div><!-- .sections -->
		</div>

		<div class="uk-width-expand@m">
			{* Issue introduction area above articles *}
				<div uk-grid uk-scrollspy-class>
					<div class="issue cover_image uk-width-1-2 uk-width-1-1@s">
						{* Issue cover image *}
						{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
						{if $issueCover}
							<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
								<img uk-img data-src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
							</a>
						{/if}
					</div>

					<div class="issue galley uk-width-1-2 uk-width-1-1@s">
						{* Full-issue galleys *}
						{if $issueGalleys}
							<h4 class="uk-heading-divider">Available Formats</h4>
							<div uk-grid class="galleys_links">
								{foreach from=$issueGalleys item=galley}
									<div class="uk-width-1-1 uk-width-1-2@s">
										{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
									</div>
								{/foreach}
							</div>
						{/if}
					</div>

					<div class="issue published-date uk-width-1-2 uk-width-1-1@s">
						{* Published date *}
						{if $issue->getDatePublished()}
							<div class="published">
								<h4 class="uk-heading-divider">{translate key="submissions.published"}</h4>
								<span class="value">
									{$issue->getDatePublished()|date_format:"%Y"}
								</span>
							</div>
						{/if}
					</div>

					{if $pubId || $doiURL}
						<div class="issue doi uk-width-1-2 uk-width-1-1@s">
						{* PUb IDs (eg - DOI) *}
							<h4 class="uk-heading-divider">DOI</h4>
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
							{if $pubId}
								{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
								<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
							<span class="type">
								{$pubIdPlugin->getPubIdDisplayType()|escape}:
							</span>
									<span class="id">
								{if $doiUrl}
									<a href="{$doiUrl|escape}">
										{$doiUrl}
									</a>
								{else}
									{$pubId}
								{/if}
							</span>
								</div>
							{/if}
						{/foreach}
					</div>
					{/if}


				</div>
		</div>



	</div>


</div>
