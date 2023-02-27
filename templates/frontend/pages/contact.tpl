{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the press's contact details.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $mailingAddress string Mailing address for the journal/press
 * @uses $contactName string Primary contact name
 * @uses $contactTitle string Primary contact title
 * @uses $contactAffiliation string Primary contact affiliation
 * @uses $contactPhone string Primary contact phone number
 * @uses $contactEmail string Primary contact email address
 * @uses $supportName string Support contact name
 * @uses $supportPhone string Support contact phone number
 * @uses $supportEmail string Support contact email address
 *}
{include file="frontend/components/header.tpl" pageTitle="about.contact"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.contact"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Contact
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
				<div class="uk-width-1-1">
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="contact" sectionTitleKey="about.contact"}
				</div>

					{if $mailingAddress}
						<div class="contact-address uk-width-1-3@s uk-width-1-1">
							<h3>
								Editorial Office
							</h3>
							<p>{$mailingAddress|nl2br|strip_unsafe_html}</p>
							<br>
						</div>
					{/if}

					{* Primary contact *}
					{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
						<div class="contact uk-width-1-3@s uk-width-1-1">
							<h3>
								{translate key="about.contact.principalContact"}
							</h3>

							{if $contactName}
								<div class="name">
									{$contactTitle|escape} {$contactName|escape}
								</div>
							{/if}

							{if $contactAffiliation}
								<div class="affiliation">
									{$contactAffiliation|strip_unsafe_html}
								</div>
							{/if}

							{if $contactPhone}
								<div class="phone">
					<span class="label">
						{translate key="about.contact.phone"}
					</span>
									<span class="value">
						{$contactPhone|escape}
					</span>
								</div>
							{/if}

							{if $contactEmail}
								<div class="email">
									<a href="mailto:{$contactEmail|escape}">
										{$contactEmail|escape}
									</a>
								</div>
							{/if}
						</div>
					{/if}

					{* Technical contact *}
					{if $supportName || $supportPhone || $supportEmail}
						<div class="contact uk-width-1-3@s uk-width-1-1">
							<h3>
								{translate key="about.contact.supportContact"}
							</h3>

							{if $supportName}
								<div class="name">
									{$supportName|escape}
								</div>
							{/if}

							{if $supportPhone}
								<div class="phone">
					<span class="label">
						{translate key="about.contact.phone"}
					</span>
									<span class="value">
						{$supportPhone|escape}
					</span>
								</div>
							{/if}

							{if $supportEmail}
								<div class="email">
									<a href="mailto:{$supportEmail|escape}">
										{$supportEmail|escape}
									</a>
								</div>
							{/if}
						</div>
					{/if}

		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
