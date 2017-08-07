<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\searchLog */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Журнал';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php if ($typeIndex) {
        echo '<p>';
            echo Html::a('Добавить запись', ['create', 'type' => $typeIndex], ['class' => 'btn btn-success']);
        echo '</p>';
    }
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'rowOptions' => function($model, $key, $index, $grid) {
            if ($model->c_type == 'add') {
                return ['style' => 'background-color:#3CB371;'];
            } else {
                return ['style' => 'background-color:#CD5C5C;'];
            }
        },
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            // 'product.c_name',
            [
                'attribute' => 'id_product',
                'label' => 'Товар',
                'format' => 'text',
                'content' => function($data) {
                    return $data->product->c_name;
                },
                'filter' => $searchModel->getProductList()
            ],
            // 'c_date',
            [
                'attribute' => 'c_date',
                'format' =>  ['date', 'Y-MM-dd HH:mm:ss'],
                'options' => ['width' => '200']
            ],
            // 'type.c_text',
            [
                'attribute' => 'c_type',
                'label' => 'Тип',
                'format' => 'text',
                'content' => function($data) {
                    return $data->type->c_text;
                },
                'filter' => $searchModel->getTypeList()
            ],
            'c_comment:ntext',
            'c_count',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
