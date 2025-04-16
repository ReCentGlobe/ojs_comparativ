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
<div class="obj_issue_toc max-w-5xl mx-auto bg-white rounded shadow p-8 my-8">
    {foreach from=$userInstitutionalSubscriptions item=userInstitutionalSubscription}
    {$userInstitutionalSubscription->getInstitutionName()|escape}
    {/foreach}

    {* Indicate if this is only a preview *}
    {if !$issue->getPublished()}
        <div class="notification mb-4">
            {include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
        </div>
    {/if}

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-8">
        <div class="md:col-span-2">
            <div class="issue description mb-6">
                {* Description *}
                {if $issue->hasDescription()}
                    <div class="description text-gray-700">
                        {$issue->getLocalizedDescription()|strip_unsafe_html}
                    </div>
                {/if}
            </div>
            {* Articles *}
            <div class="sections space-y-8">
                {foreach name=sections from=$publishedSubmissions item=section}
                    <div class="toc_section">
                        {if $section.articles}
                            {if $section.title}
                                <h4 class="text-lg font-semibold border-b border-gray-300 pb-2">
                                    {$section.title|escape}
                                </h4>
                            {/if}
                            {foreach from=$section.articles item=article}
                                <article class="bg-gray-100 p-4 rounded shadow">
                                    {include file="frontend/objects/article_summary.tpl"}
                                </article>
                            {/foreach}
                        {/if}
                    </div>
                {/foreach}
            </div><!-- .sections -->
        </div>

        <div class="md:col-span-1">
            {* Issue introduction area above articles *}
            <div class="grid gap-4">
                <div class="issue cover_image">
                    {* Issue cover image *}
                    {assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
                    {if $issueCover}
                        <a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
                            <img class="rounded shadow" src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
                        </a>
                    {/if}
                </div>

                <div class="issue galley">
                    {* Full-issue galleys *}
                    {if $issueGalleys}
                        <h4 class="text-lg font-semibold border-b border-gray-300 pb-2">Available Formats</h4>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            {foreach from=$issueGalleys item=galley}
                                <div>
                                    {include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                </div>

                <div class="issue published-date">
                    {* Published date *}
                    {if $issue->getDatePublished()}
                        <div class="published">
                            <h4 class="text-lg font-semibold border-b border-gray-300 pb-2">{translate key="submissions.published"}</h4>
                            <span class="value text-gray-700">
                                {$issue->getDatePublished()|date_format:"%Y"}
                            </span>
                        </div>
                    {/if}
                </div>

                {if $pubId || $doiURL}
                    <div class="issue doi">
                        {* Pub IDs (eg - DOI) *}
                        <h4 class="text-lg font-semibold border-b border-gray-300 pb-2">DOI</h4>
                        {foreach from=$pubIdPlugins item=pubIdPlugin}
                            {assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
                            {if $pubId}
                                {assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
                                <div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
                                    <span class="type text-gray-700">
                                        {$pubIdPlugin->getPubIdDisplayType()|escape}:
                                    </span>
                                    <span class="id text-blue-500">
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
