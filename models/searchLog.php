<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Log;

/**
 * searchLog represents the model behind the search form about `app\models\Log`.
 */
class searchLog extends Log
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_product', 'c_count'], 'integer'],
            [['c_date', 'c_type', 'c_comment'], 'safe'],
            [['c_date'], 'date', 'format' => 'yyyy-M-d']
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Log::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 10
            ],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_product' => $this->id_product,
            // 'c_date' => $this->c_date,
            'c_count' => $this->c_count,
        ]);

        $query->andFilterWhere(['like', 'c_type', $this->c_type])
            ->andFilterWhere(['like', 'c_comment', $this->c_comment]);
            // ->andFilterWhere(['=>', 'c_date', date('YMd H:m:s', strtotime($this->c_date))]);
        return $dataProvider;
    }

}
