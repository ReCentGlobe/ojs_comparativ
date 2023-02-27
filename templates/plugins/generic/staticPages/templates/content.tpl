{**
 * templates/content.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display Static Page content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

    <div class="uk-container">
        {* Display a message if no current issue exists *}
        {include file="frontend/components/breadcrumbs.tpl" currentTitle=$title}

        <h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
            {$title|escape}
        </h1>

    </div>

</section>

<section class="uk-section-default uk-section uk-section-medium">
    <div class="uk-container">
        <div uk-grid>
            <div class="uk-width-1-1">
                {$content}
            </div>
        </div>
    </div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
