{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.submissions"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Submissions
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1">
				<div class="content">
					<p>
					Comparativ publishes thematic issues and single articles with a specific focus on border-crossing flows of people, goods, capital, ideas, and other cultural patterns as well as viruses, pollution, and effects of climate change. We give preference to manuscripts that address not only the qualitative or quantitative measurement of such flows but as well take into consideration the resulting processes of revising forms of control over these flows. This revision may take the form of new institutions, spatial formats, social habits, or ideologies, to mention but a few. We also welcome contributions with theoretical and methodological considerations as well as papers on the role of transnationalism and transregionalism in any societal dimension. The rigorous double-blind peer-review process by an international body of reviewers guarantees the high quality of the journal.
					</p>
					<p>
						Each Comparativ issue consists of four sections. The article section is edited by the editor(s) in charge of the respective thematic issue¬. In the forum section articles are placed that were submitted as single articles and that are not necessarily assigned to the main theme of the thematic issue. Reviews about new scientific publications in the general thematic areas of Comparativ are published in the review section, which is followed by the section Annotations that announces books of general interest.
					</p>

					<h2>Submit a single article</h2>
					<p>
						Comparativ looks for articles of the highest quality for the forum section. We accept only texts that are not yet published or under review for publication elsewhere. Articles are accepted in English, French, and German and have to be accompanied by an abstract of 100 –150 words in English or German. In general, the article should not exceed a length of 8,000 words (including footnotes). As we are well aware that there are exceptional cases where such limitations are not appropriate, before submitting an article that goes beyond the standard length please contact the editorial office.
					</p>
					<p>
						As all articles will be published under the open access policy of the journal, and for submission all authors must accept these rules. Comparativ will make the issues immediately available to its subscribers and after 36 months to all readers via its website. Authors are allowed to post the published version on their personal/departmental website as well as place it in their institution’s official repository by connecting to the journal’s website and indicating the original place of publication.
					</p>
					<p>
						Before submitting an article, please have a look at the <a class="uk-button uk-button-default" target="_blank" href="https://www.comparativ.net/public/downloads/comparativ_english_styleguide.pdf">guidelines</a>
					</p>
					<p>
						Article Submissions are considered all time oft the year, and the review process is organized accordingly.
					</p>

					{if $isUserLoggedIn}
						{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
						<div class="cmp_notification">
							<a class="uk-button uk-button-primary" href="{url page="submission" op="wizard"}">Submit your article here</a>
						</div>
					{else}
						{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
						{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
						<div class="cmp_notification">
							{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
						</div>
					{/if}

					<p>
					or send your submission to the journal’s editorial office by mail: comparativ@uni-leipzig.de. Please provide your manuscript as a Word document (and do not submit a PDF).
					</p>


					<h2>Submit a proposal for a full thematic issue</h2>
					<p>
						Comparativ publishes six thematic issues a year, with an overall length of 45,000 to 50,000 words for each issue; additionally, the journal also considers from time to time proposals for double issues, with an overall length of up to 90,000 words.
					</p>
					<p>
						The review process is organized into two steps. In the first step, the innovative character and the coherence of a proposal for a full thematic issue is evaluated. Proposals have to be submitted by 30th September at the latest to be discussed at the annual editorial conference and to be considered for the following year. Proposals should not exceed 2,000 words and contain both a description of the overall aims of the issue and of the individual papers with the names of the planned authors. The second step of peer review applies to the manuscripts submitted and targets the individual quality of the articles as well as their original contribution to the overall aims of the thematic issue as outlined in the introduction by the guest editors of the issue.
					</p>
					<p>
						As all articles will be published under the open access policy of the journal, for submission all authors must accept these rules. Comparativ will make the issues immediately available to its subscribers and after 36 months to all readers via its website. Authors are allowed to post the published version on their personal/departmental website as well as place it in their institution’s official repository by connecting to the journal’s website and indicating the original place of publication.
					</p>

					{if $isUserLoggedIn}
						{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
						<div class="cmp_notification">
							<a class="uk-button uk-button-primary" href="{url page="submission" op="wizard"}">Submit your proposal for a full thematic issue now.</a>
						</div>
					{else}
						{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
						{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
						<div class="cmp_notification">
							{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
						</div>
					{/if}

					<p>
					or send your submission to the journal’s editorial office by mail: comparativ@uni-leipzig.de. Please provide your manuscript only as a Word document (please do not submit a PDF).
					</p>

					<h2>Submit a book review</h2>
					<p>
						Comparativ, itself being a product of the ongoing transnationalization in the humanities and social sciences, aims at facilitating scholarly dialogue across the boundaries of national academic cultures, linguistic areas, and disciplinary definitions of subject matters. It therefore focuses on reviewing forthcoming or recent publications that contribute in an innovative way to the development of transnational, transregional, and global history as well as to the study of globalization projects across world regions. We welcome suggestions for such reviews from both publishers and scholars. Reviews of individual publications should be no longer than 1,500 words; reviews of a set of publications that provide an overview of recent trends in a particular subfield of Comparativ’s general subject should not exceed the length of 4,000 words. The selection of books for review will be made by the editorial office with the help of an international board of review editors. Publishers will receive a copy of the review article once it has been published. Please note that we will not return unrequested review copies.
					</p>
					<p>
						Suggestions for reviews are considered throughout the year, please email us: comparativ@uni-leipzig.de
					</p>
					<p>
						<a class="uk-button uk-button-default" target="_blank" href="https://www.comparativ.net/public/downloads/comparativ_english_styleguide_reviews.pdf">Styleguide (PDF) (Style Guide for reviews)</a>
					</p>

				</div>

				{if $currentContext->getLocalizedSetting('copyrightNotice')}
					<div class="copyright_notice content">
						<h2>
							{translate key="about.copyrightNotice"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="distribution" anchor="permissions" sectionTitleKey="about.copyrightNotice"}
						</h2>
						{$currentContext->getLocalizedSetting('copyrightNotice')|nl2br}
					</div>
				{/if}

				{if $currentContext->getLocalizedSetting('privacyStatement')}
					<div class="privacy_statement content">
						<h2>
							{translate key="about.privacyStatement"}
							{include file="frontend/components/editLink.tpl" page="management" op="settings" path="publication" anchor="submissionStage" sectionTitleKey="about.privacyStatement"}
						</h2>
						{$currentContext->getLocalizedSetting('privacyStatement')}
					</div>
				{/if}
			</div>
		</div>
	</div>

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
