<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Categorys */

$this->title = 'Update Categorys: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Categorys', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => 'Categorys', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<div>

    <h1> <?= Html::encode($this->title) ?> </h1>
    <?= $this->render('_form', compact('model')); ?>

</div>

