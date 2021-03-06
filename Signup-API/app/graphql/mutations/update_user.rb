module Mutations
    class UpdateUser < Mutations::BaseMutation
      argument :password, String, required: false
      argument :passwordConfirmation, String, required: false

      type Types::UserType
      
      def resolve(
        password: context[:current_user] ? context[:current_user].password : '',
        password_confirmation: context[:current_user] ? context[:current_user].password_confirmation : ''
      )
        user = context[:current_user]
        return nil if !user
        user.update!(
            password: password,
            password_confirmation: password_confirmation
        )

        user

      end
    end
  end