<?php
// source: /var/www/html/cmsshop/app/src/Category/components/AdminMenu/AdminMenu.latte

class Template5ef72f8b1fff4f44e60b49d86dde8476 extends Latte\Template {
function render() {
foreach ($this->params as $__k => $__v) $$__k = $__v; unset($__k, $__v);
// prolog Latte\Macros\CoreMacros
list($_b, $_g, $_l) = $template->initialize('7542deccc6', 'html')
;
// prolog Nette\Bridges\ApplicationLatte\UIMacros

// snippets support
if (empty($_l->extends) && !empty($_control->snippetMode)) {
	return Nette\Bridges\ApplicationLatte\UIRuntime::renderSnippets($_control, $_b, get_defined_vars());
}

//
// main template
//
?>
<div id="leve_menu">
    <p class="title">
        <a href="<?php echo Latte\Runtime\Filters::escapeHtml($_presenter->link(":Legacy:LegacyAdmin:default"), ENT_COMPAT) ?>">Administrace</a>
    </p>

    <div id="hledani">
<?php $_l->tmp = $_control->getComponent("search"); if ($_l->tmp instanceof Nette\Application\UI\IRenderable) $_l->tmp->redrawControl(NULL, FALSE); $_l->tmp->render() ?>
    </div>

    <ul class="lmenu">
        <?php if (!$categories) { ?>Žádný modul nebyl nalezen.<?php } ?>


<?php $iterations = 0; foreach ($categories as $category) { $subcategories = $category->getSubcategories() ;$active = $actualCategoryId === $category->getId() || $subcategories->containsKey($actualCategoryId) ?>
            <li<?php if ($_l->tmp = array_filter(array(count($subcategories) ? 'submenu' : NULL, $category->isPublic() ?: 'hidden', $active ? 'active expanded' : NULL))) echo ' class="', Latte\Runtime\Filters::escapeHtml(implode(" ", array_unique($_l->tmp)), ENT_COMPAT), '"' ?>>
                <a href='index.php?idk=<?php echo Latte\Runtime\Filters::escapeHtml(Latte\Runtime\Filters::safeUrl($category->getId()), ENT_QUOTES) ?>
' title='Výpis <?php echo Latte\Runtime\Filters::escapeHtml($category->getTitle(), ENT_QUOTES) ?>'>
                    <?php echo Latte\Runtime\Filters::escapeHtml($category->getTitle(), ENT_NOQUOTES) ?><span class='arrow'></span>
                </a>
                <?php ob_start() ?>                <ul><?php ob_start() ;$iterations = 0; foreach ($subcategories as $sub) { ?>
                        <li<?php if ($_l->tmp = array_filter(array($sub->isPublic() ?: 'hidden', $actualCategoryId === $sub->getId() ? 'active' : NULL))) echo ' class="', Latte\Runtime\Filters::escapeHtml(implode(" ", array_unique($_l->tmp)), ENT_COMPAT), '"' ?>>
                            <a href='index.php?idk=<?php echo Latte\Runtime\Filters::escapeHtml(Latte\Runtime\Filters::safeUrl($sub->getId()), ENT_QUOTES) ?>
' title='Výpis <?php echo Latte\Runtime\Filters::escapeHtml($category->getTitle(), ENT_QUOTES) ?>'>
                                <?php echo Latte\Runtime\Filters::escapeHtml($sub->getTitle(), ENT_NOQUOTES) ?>

                            </a>
                        </li>
<?php $iterations++; } ?>
                    <?php if (in_array($category->getCode(), array('clanky', 'eshop', 'katalog', 'katalog1', 'katalog2', 'katalog4', 'faq'))) { ?>                         <li class='addCat'>
                            <a href='insert.php?idk=<?php echo Latte\Runtime\Filters::escapeHtml(Latte\Runtime\Filters::safeUrl($category->getId()), ENT_QUOTES) ?>&sablona=2' title='Přidat subkategorii'>Nová podkategorie</a>
                        </li>
<?php } ?>
                <?php $_l->ifcontent = ob_get_contents(); ob_end_flush() ?></ul>
<?php rtrim($_l->ifcontent) === "" ? ob_end_clean() : ob_end_flush() ?>
            </li>
<?php $iterations++; } ?>

<?php if ($testCategory) { ?>        <li<?php if ($_l->tmp = array_filter(array($actualCategoryId === $testCategory->getId() ? 'active' : NULL))) echo ' class="', Latte\Runtime\Filters::escapeHtml(implode(" ", array_unique($_l->tmp)), ENT_COMPAT), '"' ?>>
            <a href="index.php?idk=<?php echo Latte\Runtime\Filters::escapeHtml(Latte\Runtime\Filters::safeUrl($testCategory->getId()), ENT_COMPAT) ?>
"><?php echo Latte\Runtime\Filters::escapeHtml($testCategory->getTitle(), ENT_NOQUOTES) ?></a>
        </li>
<?php } ?>
    </ul>
</div>
<?php
}}