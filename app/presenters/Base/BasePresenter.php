<?php

namespace App\Presenters;

use Nette,
	App\Model;


/**
 * Base presenter for all application presenters.
 */
abstract class BasePresenter extends Nette\Application\UI\Presenter
{

	/**
	 * @return array
	 */
	public function formatLayoutTemplateFiles()
	{
		$list = parent::formatLayoutTemplateFiles();
		$list[] = __DIR__ . '/templates/' . basename($list[0]);
		return $list;
	}


	/**
	 * @return array
	 */
	public function formatTemplateFiles()
	{
		$list = parent::formatTemplateFiles();
		$list[] = dirname($this->getReflection()->getFileName()) . "/templates/$this->view.latte";
		return $list;
	}

}
