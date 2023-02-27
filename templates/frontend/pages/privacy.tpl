{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

  <div class="uk-container">
    {* Display a message if no current issue exists *}
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="manager.setup.privacyStatement"}

    <h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
      Privacy Policy
    </h1>

  </div>

</section>

<section class="uk-section-default uk-section uk-section-medium">
  <div class="uk-container">
    <div uk-grid>
      <div class="uk-width-1-1">
        {$currentContext->getLocalizedSetting('privacyStatement')}
      </div>
    </div>
  </div>
</section><!-- .page -->


{include file="frontend/components/footer.tpl"}