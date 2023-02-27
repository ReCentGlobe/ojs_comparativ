{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<section class="uk-section-primary uk-position-relative uk-light">
	<!-- Hero head: will stick at the top -->


	<!-- Hero content: will be in the middle -->
	<div uk-height-viewport="offset-top: true; offset-bottom: true" class="uk-section uk-section-small uk-flex uk-flex-middle uk-text-center" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:300&#125">
		<div class="uk-width-1-1">

			<div class="uk-container">
				<p uk-scrollspy-class>
					<img width="500" uk-svg class="uk-preserve uk-preserve uk-responsive-width uk-responsive-height" src="{$baseUrl}/plugins/themes/comparativ/dist/images/Comparativ.svg">
				</p>
				<p class="uk-margin-medium uk-text-lead" uk-scrollspy-class>
					{$additionalHomeContent|strip_tags}
				</p>
				<div uk-grid="" class="uk-child-width-auto uk-grid-medium uk-flex-inline uk-flex-center uk-grid" uk-scrollspy-class>
					<div class="uk-first-column">
						<a href="/v2/about/subscriptions" class="uk-button uk-button-primary tm-button-primary uk-button-large tm-button-large uk-visible@s" >Subscribe</a>
						<a href="/v2/about/subscriptions" class="uk-button uk-button-primary tm-button-primary uk-hidden@s">Subscribe</a>
					</div>
					<div>
						<a href="/v2/about/submissions" class="uk-button uk-button-default tm-button-default uk-button-large tm-button-large uk-visible@s">Submit</a>
						<a href="/v2/about/submissions" class="uk-button uk-button-default tm-button-default uk-hidden@s">Submit</a>
					</div>
				</div>

				<a href="#issue" class="uk-position-bottom-right uk-padding" uk-scroll uk-icon="icon:chevron-down; ratio: 2;"></a>
			</div>

		</div>
	</div>
</section>
<section id="issue" class="uk-background-secondary uk-section uk-section-large uk-dark" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:300&#125">
	<div class="uk-container">
		<div class="uk-flex-middle uk-grid-margin" uk-grid uk-scrollspy-class>
			<div class="uk-width-2-3@s">
				<h2 class="uk-h3 uk-heading-bullet uk-animation-fade" uk-scrollspy>
					Recent Issue
				</h2>
			</div>
			<div class="uk-width-expand@s">
				<div class="uk-margin uk-text-right@s uk-animation-fade" uk-scrollspy>
					<a class="el-content uk-button uk-button-text" href="/v2/issue/archive">
						Show all issues
					</a>
				</div>
			</div>
		</div>
		<div class="uk-grid-large uk-flex-middle uk-grid-margin-large uk-grid">
			<div class="uk-width-1-3@m uk-grid-margin">
				<div class="uk-margin">
					{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
					{if $issueCover}
						<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}" uk-scrollspy-class>
							<img class="uk-box-shadow-large uk-responsive-width uk-responsive-height" uk-img data-src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
						</a>
					{/if}
				</div>
			</div>
			<div class="uk-width-expand@m uk-grid-margin">
				<h2 class="uk-margin-remove-top uk-h2" uk-scrollspy-class="uk-animation-slide-right-medium">
					{$issue->getIssueIdentification()|strip_unsafe_html}
				</h2>

				<div class="uk-margin-medium uk-margin-remove-top" uk-scrollspy-class="uk-animation-slide-right-medium">
					</div>

				<ul class="uk-list" uk-scrollspy-class="uk-animation-slide-right-medium">
					<li class="el-item">
						<div uk-grid="" class="uk-child-width-expand uk-grid-small uk-grid">
							<div class="uk-text-break uk-width-small uk-first-column">
								<h3 class="el-title uk-h5 uk-margin-remove">Number</h3>
							</div>
							<div>
								<div class="el-content">
									{$issue->getNumber()|strip_unsafe_html}
								</div>
							</div>
						</div>
					</li>
					<li class="el-item">
						<div uk-grid="" class="uk-child-width-expand uk-grid-small uk-grid">
							<div class="uk-text-break uk-width-small uk-first-column">
								<h3 class="el-title uk-h5 uk-margin-remove">Volume</h3>
							</div>
							<div>
								<div class="el-content">
									{$issue->getVolume()|strip_unsafe_html}
								</div>
							</div>
						</div>


					</li>
				</ul>
				<div class="uk-margin-medium" uk-scrollspy-class="uk-animation-slide-right-medium">
					<a class="el-content uk-button uk-button-text" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
						Show Issue
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

{* Additional Homepage Content
{if $additionalHomeContent}
	<section class="hero is-light">
		<div class="hero-body">
			<div class="container">
				<div class="additionalcontent">
					<h2 class="title has-text-centered">{translate key="about.aboutContext"}</h2>
                    {$additionalHomeContent}
				</div>
			</div>
		</div>
	</section>
{/if}
*}

{* Announcements *}
{if $numAnnouncementsHomepage && $announcements|@count}
	<section class="uk-section-muted uk-section uk-section-large" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:300&#125">
	<div class="uk-container">
		<div class="uk-flex-middle uk-grid-margin" uk-grid>
			<div class="uk-width-2-3@s">
				<h2 class="uk-h3 uk-heading-bullet" uk-scrollspy-class>
					Press
				</h2>
			</div>
			<div class="uk-width-expand@s">
				<div class="uk-margin uk-text-right@s" uk-scrollspy-class>
					<a class="el-content uk-button uk-button-text" href="/allissues">
						Show all press reviews
					</a>
				</div>
			</div>
		</div>
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
	</div>
</section>
{/if}



{call_hook name="Templates::Index::journal"}

{**
<section class="section page_index_journal">
<div class="container">




{if $homepageImage}
  <div class="homepage_image">
    <img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
  </div>
{/if}

{if $issue}
  <div class="current_issue">
    <h2>
      {translate key="journal.currentIssue"}
    </h2>
    <div class="current_issue_title">
      {$issue->getIssueIdentification()|strip_unsafe_html}
    </div>
    {include file="frontend/objects/issue_toc.tpl"}
    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
      {translate key="journal.viewAllIssues"}
    </a>
  </div>
{/if}


	</div>
</section><!-- .page -->
*}

{include file="frontend/components/footer.tpl"}
